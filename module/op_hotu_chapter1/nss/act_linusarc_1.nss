//::///////////////////////////////////////////////
//:: Name act_linusarc_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Raise Linu from the dead
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 16/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void RaiseLinu(location lSpawn, object oRaiser);
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nLinuRaised") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nLinuRaised", 1);

    location lSpawn = GetLocation(GetWaypointByTag("wp_q2clinu_spawn"));
    effect eVis = EffectVisualEffect(VFX_IMP_RAISE_DEAD);
    object oPC = GetPCSpeaker();

    //XP reward
    Reward_2daXP(oPC, 11);

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lSpawn);
    DelayCommand(0.5, RaiseLinu(lSpawn, oPC));

    //Take away charge on the Rod if it was used.
    int iResult = GetHasSpell(SPELL_RESURRECTION, oPC);
    int iResult2 = GetHasSpell(SPELL_RAISE_DEAD, oPC);

    //if the PC couldn't have used a spell - then must have used the rod
    if (iResult == FALSE && iResult2 == FALSE)
    {
        //See if the PC has a rod of ressurrection
        object oRod = GetItemPossessedBy(oPC, "x2_rodresurrect");
        SetItemCharges(oRod, GetItemCharges(oRod) - 1);
    }
}

void RaiseLinu(location lSpawn, object oRaiser)
{
    object oLinu = CreateObject(OBJECT_TYPE_CREATURE, "x2_hen_linu2", lSpawn);
    //Level up Linu a bit so she doesn't get killed
    int nLevel;
    for (nLevel = 0; nLevel < 10; nLevel++)
    {
        LevelUpHenchman(oLinu);
    }
    object oArea = GetArea(oRaiser);
    //Transform Rakshasa if they haven't been already..
    //and if they aren't around - have Linu talk to the PC..
    if (GetLocalInt(oArea, "X2_RakTransformed") != 1)
        ExecuteScript("act_q2rakattack", oArea);
    else
        DelayCommand(1.0, AssignCommand(oLinu, ActionStartConversation(oRaiser, "q2alinu")));
}
