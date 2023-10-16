//::///////////////////////////////////////////////
//:: FileName henchmaxed1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 7/5/2002 10:31:17
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Inspect local variables
    int MaxedOut = GetLocalInt(OBJECT_SELF,"MaxedOut");
    int BuffedUp = GetLocalInt(GetPCSpeaker(),"BuffedUp");

    if (!MaxedOut && !BuffedUp) return TRUE;

    return FALSE;
}
