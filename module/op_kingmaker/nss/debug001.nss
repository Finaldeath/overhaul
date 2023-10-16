//::///////////////////////////////////////////////
//:: DEBUG001.nss
//:: Copyright (c) 2004 Bioware Corp.
//:://////////////////////////////////////////////
/*
  This is an emergency work around script. It is
  used to free players who get stuck in cutscene
  or lose command of their Player Character due
  to a problem in script.

  This script will remove all effects, end cutscene
  mode, and set the player to a commandable state
  and can only be called from the debug command line
  while in debug mode.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: October 18, 2004
//:://////////////////////////////////////////////

void RemoveCutscene(object oPC);

void main()
{
    object  oPC = GetFirstPC();

    // cycle through all PC objects and free them
    while (GetIsObjectValid(oPC) == TRUE)
    {
        RemoveCutscene(oPC);
        oPC = GetNextPC();
    }
}

void RemoveCutscene(object oPC)
{
    // reset the cutscene and commandable flags
    SetCutsceneMode(oPC, FALSE);
    SetCommandable(TRUE, oPC);

    effect eEffect = GetFirstEffect(oPC);

    // remove all effects because the player could also be
    // cutscene invisible or cutscene paralyzed
    while (GetIsEffectValid(eEffect) == TRUE)
    {
        RemoveEffect(oPC, eEffect);
        eEffect = GetNextEffect(oPC);
    }
}
