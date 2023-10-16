//::///////////////////////////////////////////////
//:: Name hx_gen_onexit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     A generic onexit script that will have the
     PC autosave.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 22, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetExitingObject();

    if(GetIsPC(oPC))
    {
        DoSinglePlayerAutoSave();
    }
}
