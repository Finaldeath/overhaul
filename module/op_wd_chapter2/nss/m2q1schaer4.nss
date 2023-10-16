//* At least one of Yesgar's followers (Zor, Stirge, Delilah, and Wyvern) still has an ear.
#include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = ( (GetIsObjectValid(GetItemPossessedBy(GetObjectByTag("M2Q1CZOR"),"M2Q1ITEARZOR")))
                 || (GetIsObjectValid(GetItemPossessedBy(GetObjectByTag("M2Q1CSTIRGE"),"M2Q1ITEARSTIRGE")))
                 || (GetIsObjectValid(GetItemPossessedBy(GetObjectByTag("M2Q1CWYVERN"),"M2Q1ITEARWYVERN")))
                 || (GetIsObjectValid(GetItemPossessedBy(GetObjectByTag("M2Q1CDELILAH"),"M2Q1ITEARDELILAH"))));
	return l_iResult;
}
