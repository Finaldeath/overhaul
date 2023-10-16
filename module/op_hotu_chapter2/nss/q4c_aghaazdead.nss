//::///////////////////////////////////////////////
//:: q6_aghaazdead
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Checks if aghaaz is dead
   And if Ferron not told yet
   And if Ferron's quest is still active
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: September 4, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;
    object oAghaaz = GetObjectByTag("q4c_aghaaz");

    if ((GetIsObjectValid(oAghaaz) == FALSE || GetIsDead(oAghaaz)) &&
        (GetLocalInt(OBJECT_SELF,"Aghaaz_Dead") == 0 && GetLocalInt(GetModule(),"Ferron")!=99))
        return TRUE;
    return FALSE;
}

