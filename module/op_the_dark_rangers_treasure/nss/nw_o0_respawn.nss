//::///////////////////////////////////////////////
//:: Generic On Pressed Respawn Button
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
// * June 1: moved RestoreEffects into plot include
*/
//:://////////////////////////////////////////////
//:: Created By:   Brent
//:: Created On:   November
//:://////////////////////////////////////////////
#include "nw_i0_plot"

// * Applies an XP and GP penalty
// * to the player respawning
void ApplyPenalty(object oDead)
{
    int nXP = GetXP(oDead);
    int nPenalty = 50 * GetHitDice(oDead);
    int nHD = GetHitDice(oDead);
    // * You can not lose a level with this respawning
    int nMin = ((nHD * (nHD - 1)) / 2) * 1000;

    int nNewXP = nXP - nPenalty;
    if (nNewXP < nMin)
       nNewXP = nMin;
    SetXP(oDead, nNewXP);
    int nGoldToTake =    FloatToInt(0.10 * GetGold(oDead));
    // * a cap of 10 000gp taken from you
    if (nGoldToTake > 10000)
    {
        nGoldToTake = 10000;
    }
    AssignCommand(oDead, TakeGoldFromCreature(nGoldToTake, oDead, TRUE));
    DelayCommand(4.0, FloatingTextStrRefOnCreature(58299, oDead, FALSE));
    DelayCommand(4.8, FloatingTextStrRefOnCreature(58300, oDead, FALSE));

}

///////////////////////////////////////////////////////////////////////
// this function resets variabls and clears the arenas in the fighter
// 'gauntlet' subplot in chapter one
///////////////////////////////////////////////////////////////////////

void ClearArena(object oPC,string sArena)
{
    if(sArena == "Map_M1S4C")
    {
        DestroyObject(GetObjectByTag("M1S04CHRUSK02"));
        DestroyObject(GetObjectByTag("M1S4CBeast"));
        SetLocalInt(GetObjectByTag(sArena),"NW_A_M1S4HruskDef",0);
    }
    else if(sArena == "Map_M1S4D")
    {
        DestroyObject(GetObjectByTag("M1S04CFASHI02"));
        DestroyObject(GetObjectByTag("M1S4DBeast"));
        SetLocalInt(GetObjectByTag(sArena),"NW_A_M1S4FashiDef",0);
        CreateItemOnObject("M1S04IBADGELVL01",oPC);
    }
    else if(sArena == "Map_M1S4E")
    {
        DestroyObject(GetObjectByTag("M1S04CAGAR02"));
        DestroyObject(GetObjectByTag("M1S4EBeast"));
        SetLocalInt(GetObjectByTag(sArena),"NW_A_M1S4AgarDef",0);
        CreateItemOnObject("M1S04IBADGELVL02",oPC);
    }
    else if(sArena == "Map_M1S4F")
    {
        DestroyObject(GetObjectByTag("M1S04CCLAUDUS02"));
        DestroyObject(GetObjectByTag("M1S4FBeast",0));
        DestroyObject(GetObjectByTag("M1S4FBeast",1));
        SetLocalInt(GetObjectByTag(sArena),"NW_A_M1S4ClaudusDef",0);
        CreateItemOnObject("M1S04IBADGELVL03",oPC);
    }
    SetLocalInt(oPC,"NW_L_M1S4Won",FALSE);
    SetLocalInt(GetModule(),"NW_G_" + sArena + "_Occupied",FALSE);
}

//////////////////////////////////////////////////////////////////////////////


void main()
{
    object oRespawner = GetLastRespawnButtonPresser();
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oRespawner);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oRespawner)), oRespawner);
    RemoveEffects(oRespawner);

    string sDestTag = "WP_Death_Inn";

    //Spawn the player back at the Inn unless the player has already entered
    //the ruins, in which case spawn them in there.
    int iEnteredRuins = GetLocalInt(GetModule(), "EnteredRuins");

    if (iEnteredRuins == TRUE)
    {
        sDestTag = "WP_Death_Ruins";
    }

    //* Return PC to the Respawn Point
     if (GetIsObjectValid(GetObjectByTag(sDestTag)))
    {
        object oSpawnPoint = GetObjectByTag(sDestTag);
        AssignCommand(oRespawner,JumpToLocation(GetLocation(oSpawnPoint)));
        // * mak
    }
    else
    {
        // * do nothing, just 'res where you are.
    }
 }
