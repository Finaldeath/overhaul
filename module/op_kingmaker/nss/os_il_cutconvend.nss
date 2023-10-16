//::///////////////////////////////////////////////
//:: os_il_cutconv
//:: Copyright (c) 2004 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Ends the cutscene if the dialog exits normally
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: April 2004
//:://////////////////////////////////////////////

void main()
{
    object oPCSpeaker = GetFirstPC();
    object oIllithid = GetObjectByTag("KM_TRICKLIGHT");
    object oMagicWep = GetObjectByTag("q3ai_mw_intro");

    DestroyObject(oIllithid);
    DestroyObject(oMagicWep);

    SetCutsceneMode(oPCSpeaker, FALSE);
}
