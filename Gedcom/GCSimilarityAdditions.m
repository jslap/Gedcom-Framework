//
//  GCSimilarityAdditions.m
//  Gedcom
//
//  Created by Mikkel Eide Eriksen on 25/04/13.
//  Copyright (c) 2013 Mikkel Eide Eriksen. All rights reserved.
//

#import "GCSimilarityAdditions.h"

#import "GCAttribute.h"
#import "GCRelationship.h"

#import "GCTagAccessAdditions.h"

@implementation GCContext (GCSimilarityAdditions)

- (NSDictionary *)recordsSimilarTo:(GCRecord *)record
{
    return nil; //TODO
}

@end

@implementation GCRecord (GCSimilarityAdditions)

- (GCSimilarity)similarityTo:(GCRecord *)record 
{
    if ([self class] != [record class]) {
        return 0.0f;
    }
    
    NSUInteger count = 0;
    GCSimilarity sum = 0.0f;
    
    for (NSString *type in self.validPropertyTypes) {
        if ([self allowsMultipleOccurrencesOfPropertyType:type]) {
            
        } else {
            count++;
            if (([self valueForKey:type] && ![record valueForKey:type]) ||
                (![self valueForKey:type] && [record valueForKey:type])) {
                sum += 0.0f;
            } else if (![self valueForKey:type] && ![record valueForKey:type]) {
                sum += 1.0f;
            } else {
                sum += [[self valueForKey:type] similarityTo:[record valueForKey:type]];
            }
        }
    }
    
    return sum/count;
}

@end

@implementation GCProperty (GCSimilarityAdditions)

- (GCSimilarity)similarityTo:(GCProperty *)property
{
    NSLog(@"You must override %@ in %@", NSStringFromSelector(_cmd), [self className]);
    [self doesNotRecognizeSelector:_cmd];
    __builtin_unreachable();
}

@end

@implementation GCAttribute (GCSimilarityAdditions)

- (GCSimilarity)similarityTo:(GCAttribute *)attribute
{
    if ([self class] != [attribute class]) {
        return 0.0f;
    }
    
    return [self.value similarityTo:attribute.value];
}

@end

@implementation GCRelationship (GCSimilarityAdditions)

- (GCSimilarity)similarityTo:(GCRelationship *)relationship
{
    if ([self class] != [relationship class]) {
        return 0.0f;
    }
    
    return [self.target similarityTo:relationship.target];
}

@end

@implementation GCValue (GCSimilarityAdditions)

- (GCSimilarity)similarityTo:(GCValue *)value
{
    NSLog(@"You must override %@ in %@", NSStringFromSelector(_cmd), [self className]);
    [self doesNotRecognizeSelector:_cmd];
    __builtin_unreachable();
}

@end




/* strcmp95.c   Version 2.1						      */

/* The strcmp95 function returns a double precision value from 0.0 (total
 disagreement) to 1.0 (character-by-character agreement).  The returned
 value is a measure of the similarity of the two strings.                   */

/* Date of Release:  Jan. 10, 2009					      */
/* Modified: eliminate limitation of MAX_VAR_SIZE
 Authors:  modification made by Shu-Chun Weng (scw@csie.org)                */
/* Date of Release (2.0):  Jan. 26, 1994				      */
/* Modified: April 24, 1994  Corrected the processing of the single length
 character strings.
 Authors:  This function was written using the logic from code written by
 Bill Winkler, George McLaughlin and Matt Jaro with modifications
 by Maureen Lynch.
 Comment:  This is the official string comparator to be used for matching
 during the 1995 Test Census.                                     */

#include <ctype.h>
#include <string.h>
#include <stdlib.h>

#define NOTNUM(c)	((c>57) || (c<48))
#define INRANGE(c)      ((c>0)  && (c<91))
/* #define MAX_VAR_SIZE 250 */

double strcmp95(char *ying, char *yang, long y_length, int *ind_c)

{
    /* Arguments:
     
     ying and yang are pointers to the 2 strings to be compared.  The strings
     need not be NUL-terminated strings because the length is passed.
     
     y_length is the length of the strings.
     
     ind_c is an array that is used to define whether certain options should be
     activated.  A nonzero value indicates the option is deactivated.
     The options are:
     ind_c[0] Increase the probability of a match when the number of matched
     characters is large.  This option allows for a little more
     tolerance when the strings are large.  It is not an appropriate
     test when comparing fixed length fields such as phone and
     social security numbers.
     ind_c[1] All lower case characters are converted to upper case prior
     to the comparison.  Disabling this feature means that the lower
     case string "code" will not be recognized as the same as the
     upper case string "CODE".  Also, the adjustment for similar
     characters section only applies to uppercase characters.
     
     The suggested values are all zeros for character strings such as names.    */
    
    static	int	pass=0,	adjwt[91][91];
    static	char	sp[39][2] =
    {'A','E',  'A','I',  'A','O',  'A','U',  'B','V',  'E','I',  'E','O',  'E','U',
        'I','O',  'I','U',  'O','U',  'I','Y',  'E','Y',  'C','G',  'E','F',
        'W','U',  'W','V',  'X','K',  'S','Z',  'X','S',  'Q','C',  'U','V',
        'M','N',  'L','I',  'Q','O',  'P','R',  'I','J',  '2','Z',  '5','S',
        '8','B',  '1','I',  '1','L',  '0','O',  '0','Q',  'C','K',  'G','J',
        'E',' ',  'Y',' ',  'S',' '};
    
    char*    ying_hold,
    *   yang_hold,
    *   ying_flag,
    *   yang_flag;
    
    double  weight,	Num_sim;
    
    long    minv,   search_range,   lowlim,    ying_length,
    hilim,  N_trans,        Num_com,   yang_length;
    
    int	yl1,	yi_st,	N_simi;
    
    register        int     i,      j,      k;
    
    /* Initialize the adjwt array on the first call to the function only.
     The adjwt array is used to give partial credit for characters that
     may be errors due to known phonetic or character recognition errors.
     A typical example is to match the letter "O" with the number "0"           */
    if (!pass) {
        pass++;
        for (i=0; i<91; i++) for (j=0; j<91; j++) adjwt[i][j] = 0;
        for (i=0; i<36; i++) {
            adjwt[sp[i][0]][sp[i][1]] = 3;
            adjwt[sp[i][1]][sp[i][0]] = 3;
        } }
    
    /* Identify the strings to be compared by stripping off all leading and
     trailing spaces.							      */
    k = y_length - 1;
    for(j = 0;((ying[j]==' ') && (j < k));j++);
    for(i = k;((ying[i]==' ') && (i > 0));i--);
    ying_length = i + 1 - j;
    yi_st = j;
    
    for(j = 0;((yang[j]==' ') && (j < k));j++);
    for(i = k;((yang[i]==' ') && (i > 0));i--);
    yang_length = i + 1 - j;
    
    /* If either string is blank - return - added in Version 2                    */
    if(ying_length <= 0 || yang_length <= 0) return(0.0);
    
    ying_hold = (char*) malloc(sizeof(char) * (ying_length + 1));
    yang_hold = (char*) malloc(sizeof(char) * (yang_length + 1));
    
    strncpy(ying_hold,&ying[yi_st],ying_length);
    strncpy(yang_hold,&yang[j],yang_length);
    
    if (ying_length > yang_length) {
        search_range = ying_length;
        minv = yang_length;
    }
    else {
        search_range = yang_length;
        minv = ying_length;
    }
    
    /* If either string is blank - return                                         */
    /* if (!minv) return(0.0);                   removed in version 2             */
    
    /* Blank out the flags							      */
    ying_flag = (char*) malloc(sizeof(char) * search_range);
    yang_flag = (char*) malloc(sizeof(char) * search_range);
    
    memset(ying_flag, ' ', search_range);
    memset(yang_flag, ' ', search_range);
    search_range = (search_range/2) - 1;
    if (search_range < 0) search_range = 0;   /* added in version 2               */
    
    /* Convert all lower case characters to upper case.                           */
    if (!ind_c[1]) {
        for (i = 0;i < ying_length;i++) if (islower(ying_hold[i])) ying_hold[i] -= 32;
        for (j = 0;j < yang_length;j++) if (islower(yang_hold[j])) yang_hold[j] -= 32;
    }
    
    /* Looking only within the search range, count and flag the matched pairs.    */
    Num_com = 0;
    yl1 = yang_length - 1;
    for (i = 0;i < ying_length;i++) {
        lowlim = (i >= search_range) ? i - search_range : 0;
        hilim = ((i + search_range) <= yl1) ? (i + search_range) : yl1;
        for (j = lowlim;j <= hilim;j++)  {
            if ((yang_flag[j] != '1') && (yang_hold[j] == ying_hold[i])) {
                yang_flag[j] = '1';
                ying_flag[i] = '1';
                Num_com++;
                break;
            } } }
    
    /* If no characters in common - return                                        */
    if (!Num_com){
        free(ying_hold);
        free(yang_hold);
        free(ying_flag);
        free(yang_flag);
        return(0.0);
    }
    
    /* Count the number of transpositions                                         */
    k = N_trans = 0;
    for (i = 0;i < ying_length;i++) {
        if (ying_flag[i] == '1') {
            for (j = k;j < yang_length;j++) {
                if (yang_flag[j] == '1') {
                    k = j + 1;
                    break;
                } }
            if (ying_hold[i] != yang_hold[j]) N_trans++;
        } }
    N_trans = N_trans / 2;
    
    /* adjust for similarities in nonmatched characters                           */
    N_simi = 0;
    if (minv > Num_com) {
        for (i = 0;i < ying_length;i++) {
            if (ying_flag[i] == ' ' && INRANGE(ying_hold[i])) {
                for (j = 0;j < yang_length;j++) {
                    if (yang_flag[j] == ' ' && INRANGE(yang_hold[j])) {
                        if (adjwt[ying_hold[i]][yang_hold[j]] > 0) {
                            N_simi += adjwt[ying_hold[i]][yang_hold[j]];
                            yang_flag[j] = '2';
                            break;
                        } } } } } }
    Num_sim = ((double) N_simi)/10.0 + Num_com;
    
    /* Main weight computation.						      */
    weight= Num_sim / ((double) ying_length) + Num_sim / ((double) yang_length)
    + ((double) (Num_com - N_trans)) / ((double) Num_com);
    weight = weight / 3.0;
    
    /* Continue to boost the weight if the strings are similar                    */
    if (weight > 0.7) {
        
        /* Adjust for having up to the first 4 characters in common                 */
        j = (minv >= 4) ? 4 : minv;
        for (i=0;((i<j)&&(ying_hold[i]==yang_hold[i])&&(NOTNUM(ying_hold[i])));i++);
        if (i) weight += i * 0.1 * (1.0 - weight);
        
        /* Optionally adjust for long strings.                                      */
        /* After agreeing beginning chars, at least two more must agree and 
         the agreeing characters must be > .5 of remaining characters.          */
        if ((!ind_c[0]) && (minv>4) && (Num_com>i+1) && (2*Num_com>=minv+i)) 
            if (NOTNUM(ying_hold[0])) 
                weight += (double) (1.0-weight) *
                ((double) (Num_com-i-1) / ((double) (ying_length+yang_length-i*2+2)));
    }
    
    free(ying_hold);
    free(yang_hold);
    free(ying_flag);
    free(yang_flag);
    return(weight);
    
} /* strcmp95 */


@implementation GCNamestring (GCSimilarityAdditions)

- (GCSimilarity)similarityTo:(GCNamestring *)value
{
    if ([self class] != [value class]) {
        return 0.0f;
    }
    
    const char *ying = [self.gedcomString cStringUsingEncoding:NSUTF8StringEncoding];
    const char *yang = [value.gedcomString cStringUsingEncoding:NSUTF8StringEncoding];
    int opts[] = {0,0};
    
    return strcmp95((char *)ying, (char *)yang, MAX(strlen(ying), strlen(yang)), opts);
}

@end

@implementation GCGender (GCSimilarityAdditions)

- (GCSimilarity)similarityTo:(GCGender *)value
{
    if ([self class] != [value class]) {
        return 0.0f;
    }
    
    if (self == value) {
        return 1.0f;
    } else if (self == [GCGender unknownGender] || value == [GCGender unknownGender]) {
        return 0.5f;
    } else {
        return 0.0f;
    }
}

@end