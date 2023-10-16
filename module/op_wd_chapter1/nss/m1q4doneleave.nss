//::///////////////////////////////////////////////
//::
//:: OnSpawnIn
//::
//:: M1Q4DoneLeave.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: This script causes the character to leave when
//:: the main plot is done.
//::
//::
//:://////////////////////////////////////////////
//::
//:: Created By: John
//:: Created On: September 14, 2001
//::
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(),"NW_G_M1Q4") == 10)
    {
        DestroyObject(OBJECT_SELF);
    }

    // This is the initialization of the Listening Patterns from the Default scripts.
    SetListening(OBJECT_SELF,TRUE);
    SetListenPattern(OBJECT_SELF,"NW_I_WAS_ATTACKED",0);
}
