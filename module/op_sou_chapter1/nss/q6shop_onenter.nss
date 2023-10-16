//::///////////////////////////////////////////////
//:: Name q6shop_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When PC enters Deekin's shop - if Deekin is gone
    (which should only happen if the PC recovers the
    Mask without first recovering the Dragon Tooth),
    then put out the fire and set a variable1
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 15/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE && GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        //if Deekin has never spawned before - spawn him in
        if (GetLocalInt(GetModule(), "X1_DeekinSpawn") == 0)
        {
           SetLocalInt(GetModule(), "X1_DeekinSpawn", 1);
            SetLocalInt(GetModule(), "X1_DeekinSpawnAtShop", 2);
            location lSpawn = GetLocation(GetWaypointByTag("wp_q6a_deekin_shop_spn"));
            object oDeekin = CreateObject(OBJECT_TYPE_CREATURE, "q6deekin", lSpawn);
            SetLocalInt(oDeekin, "q6_Deekin_Talk_PC", 0);

            AssignCommand(oDeekin, ActionStartConversation(oPC));
            SetMapPinEnabled(GetWaypointByTag("mn_deekin_blumberg"), TRUE);
        }
        //else see if Deekin still exists - if not -change store
        else
        {
            object oDeekin1 = GetObjectByTag("q6deekin");
            if (GetIsObjectValid(oDeekin1) == FALSE)
            {
                //if Deekin is not here - turn out his campfire - display string for PC
                object oFire = GetObjectByTag("q6_deekin_fire");
                AssignCommand(oFire, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
                SetLocalInt(oPC, "X1_DeekinNotInBlumberg", 1);
                FloatingTextStrRefOnCreature(40397, oPC);
                SetLocalInt(OBJECT_SELF, "nTriggered", 1);
                object oFireSound = GetObjectByTag("snd_q6acampfire");
                SoundObjectStop(oFireSound);
            }
            else
            {
                SetMapPinEnabled(GetWaypointByTag("mn_deeking_blumberg"), TRUE);
            }
        }
    }

}
