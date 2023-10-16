//::///////////////////////////////////////////////
//:: Finish Elven Trial quest
//:: q2_trig_amu_jour
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When player lives the puzzle room (with the amulet) -
    finish the quest on the on-enter trigger event

UPDATE 4/7/03 Keith Warner
    If the player is a Paladin - spawn in some special
    treasure for them..
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "nw_i0_plot"
#include "q2_inc_plot"

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPlayerCharacter(oPC))
        return;
    if(GetItemPossessedBy(oPC, "x1ascalhorn") != OBJECT_INVALID)
    {
        SetPlot("Q2_JOURNAL_ELVEN_TEST", 100, oPC);
        //Spawn in Reward chest (q2testchest) at wp_q2_testchest
        //if the PC is a Paladin
        if (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) > 0 )
        {
            if (GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
            {
                SetLocalInt(OBJECT_SELF, "nTriggered", 1);
                location lSpawn1 = GetLocation(GetWaypointByTag("wp_q2_testchest"));

                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_BREACH), lSpawn1);
                DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DEATH_WARD), lSpawn1));
                CreateObject(OBJECT_TYPE_PLACEABLE, "q2testchest", lSpawn1);
                //have dialog object congratulate the PC..
                object oDialog = GetObjectByTag("q2rewarddialog");
                AssignCommand(oDialog, SpeakOneLinerConversation());
            }
        }
    }
}
