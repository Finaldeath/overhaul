//::///////////////////////////////////////////////
//:: FileName q4a_class_chk
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 1/14/2003 9:51:53 AM
//:://////////////////////////////////////////////
int StartingConditional()
{

	// Restrict based on the player's class
	int iPassed = 0;
	if(GetLevelByClass(CLASS_TYPE_DRUID, GetPCSpeaker()) >= 1)
		iPassed = 1;
	if((iPassed == 0) && (GetLevelByClass(CLASS_TYPE_RANGER, GetPCSpeaker()) >= 1))
		iPassed = 1;
	if(iPassed == 0)
		return FALSE;

	return TRUE;
}
