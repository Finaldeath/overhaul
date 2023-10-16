//::///////////////////////////////////////////////
//:: Name q1r_endcon_becka
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the Rumgut plot is over and Becka's conversation
    is aborted then jump Becka back to the farm.
    Unless she has been attacked..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 1/03
//:://////////////////////////////////////////////
void JumpToFarm(object oPC);
void main()
{
    if (GetLocalInt(GetModule(), "X1_Q1RuralRebFree") > 60 && GetLocalInt(GetModule(), "X1_Q1RBeckaJumpToFarm") != 1)
    {
        if (GetIsInCombat() == FALSE)
        {
            object oReb = OBJECT_SELF;
            SetLocalInt(GetModule(), "X1_Q1RBeckaJumpToFarm", 1);
            SetLocalInt(GetModule(), "X1_PCBeccaEscape", 2);
            SetLocalInt(GetModule(), "X1_Q1RuralRebFree", 70);
            object oExit = GetWaypointByTag("wp_q1rbecka_running2");
            ActionMoveToObject(oExit, TRUE);
            SetPlotFlag(oReb, TRUE);
            SetCommandable(FALSE);

            DelayCommand(5.0, JumpToFarm(OBJECT_SELF));
           //DelayCommand(6.0, SetPlotFlag(oReb, FALSE));
        }
    }
}

void JumpToFarm(object oPC)
{
    SetCommandable(TRUE);
    //if (GetIsInCombat(oPC) == FALSE)
    //{
    /*    object oSpawn = GetWaypointByTag("wp_q1hurst_spnreb");
        JumpToObject(oSpawn);
        DelayCommand(1.0, AssignCommand(oPC, ClearAllActions(TRUE)));
    //}
    */
    DestroyObject(OBJECT_SELF);
    location lSpawn = GetLocation(GetWaypointByTag("wp_q1hurst_spnreb"));
    CreateObject(OBJECT_TYPE_CREATURE, "q1ruralrebecca", lSpawn);
    //RewardXP("xpmid",50,oPC);
}
