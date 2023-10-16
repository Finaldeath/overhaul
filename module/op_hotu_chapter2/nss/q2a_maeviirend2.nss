//::///////////////////////////////////////////////
//:: q2a_maeviirend2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  End dialog script for cut scene inside the Maeviir house
 Give player reward and teleport them outside
*/
//:://////////////////////////////////////////////

#include "nw_i0_plot"
#include "x0_i0_henchman"
void WrapJump(object oHench);

void main()
{
    //Remove Zesyyr and her personal guards from the city
    //Teleport the party back outside the tower
    //Give party their reward
    object oTeleportTo = GetWaypointByTag("wp_q2a_maehouse_exit");
    object oPC = GetPCSpeaker();

    // This var is used to init dialog between Zesyyr and the player and since she is done
    // with it there is no more need for that var
    DeleteLocalInt(OBJECT_SELF, "X2_IN_HOUSE");

    //Raise any dead henchmen in the area..
    object oDeekin = GetObjectByTag("x2_hen_deekin");
    if (GetIsObjectValid(oDeekin) == TRUE)
    {
        if (GetIsDead(oDeekin) == TRUE)
        {
            if (GetArea(oDeekin) == GetArea(oPC))
            {
                WrapJump(oDeekin);
                HireHenchman(oPC, oDeekin);
            }
        }
    }
    object oValen = GetObjectByTag("x2_hen_valen");
    if (GetIsObjectValid(oValen) == TRUE)
    {
        if (GetIsDead(oValen) == TRUE)
        {
            if (GetArea(oValen) == GetArea(oPC))
            {
                WrapJump(oValen);
                HireHenchman(oPC, oValen);
            }
        }
    }
    object oNathyrra = GetObjectByTag("x2_hen_nathyra");
    if (GetIsObjectValid(oNathyrra) == TRUE)
    {
        if (GetIsDead(oNathyrra) == TRUE)
        {
            if (GetArea(oNathyrra) == GetArea(oPC))
            {
                WrapJump(oNathyrra);
                HireHenchman(oPC, oNathyrra);
            }
        }
    }

    AssignCommand(oPC, JumpToObject(oTeleportTo));

    if (GetLocalInt(OBJECT_SELF, "nZesyyrGiveReward") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nZesyyrGiveReward", 1);
    Reward_2daXP(oPC, 53);
    GiveGoldToCreature(oPC, 20000);
    AddJournalQuestEntry("q2_zesyyr", 99, oPC);

    //Variable so that Maeviir betrayal cutscene does not happen
    SetLocalInt(GetModule(), "X2_Q2ABattle2_Maeviir", 1);

    if (GetLocalInt(OBJECT_SELF, "nZesyyrGrantsWeapon") == 1)
    {
        //make sure PC didn't already pick it up
        object oWeapon = GetItemPossessedBy(oPC, "q2a_teb_scythe");
        if (GetIsObjectValid(oWeapon) == FALSE)
            CreateItemOnObject("q2a_teb_scythe", oPC);

    }
}

void WrapJump(object oHench)
{
    if (GetIsDead(oHench))
    {
        string sTarget = "wp_q2azesplot_deadhench";
        // * Resurrect and heal again, just in case
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectResurrection(), oHench);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectHeal(GetMaxHitPoints(oHench)), OBJECT_SELF);

        // * recursively call self until we are alive again
        DelayCommand(1.0f,WrapJump(oHench));
        return;
    }
    AssignCommand(oHench, JumpToObject(GetWaypointByTag("wp_q2azesplot_deadhench"), FALSE));

}

