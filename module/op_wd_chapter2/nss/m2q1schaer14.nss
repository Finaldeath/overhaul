//* None of Yesgar's followers (Zor, Stirge, Delilah, and Wyvern) still has an ear.
#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = ( (GetIsObjectValid(GetItemPossessedBy(GetObjectByTag("M2Q1CZOR"),"M2Q1ITEARZOR"))) == FALSE
                 && (GetIsObjectValid(GetItemPossessedBy(GetObjectByTag("M2Q1CSTIRGE"),"M2Q1ITEARSTIRGE"))) == FALSE
                 && (GetIsObjectValid(GetItemPossessedBy(GetObjectByTag("M2Q1CWYVERN"),"M2Q1ITEARWYVERN"))) == FALSE
                 && (GetIsObjectValid(GetItemPossessedBy(GetObjectByTag("M2Q1CDELILAH"),"M2Q1ITEARDELILAH"))) == FALSE);
	return l_iResult;
}

