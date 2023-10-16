//::///////////////////////////////////////////////
//:: Nursing User Defined
//:: M4_NURSING_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make the NPC bend over a patient.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: March 12, 2002
//:://////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    int nUser = GetUserDefinedEventNumber();

/*    if(nUser == 1001)
    {
        object oWounded = GetNearestObjectByTag("M4_WOUNDED");
        int nNurse = GetLocalInt(OBJECT_SELF, "NW_M4_NURSE");
        if(nNurse == FALSE && !IsInConversation(OBJECT_SELF) && !GetIsInCombat())
        {
            if(GetIsObjectValid(GetObjectByTag("M4_WOUNDED")))
            {
                if(GetDistanceToObject(GetObjectByTag("M4_WOUNDED"))<=0.01)
                {
                    SetLocalInt(OBJECT_SELF, "NW_M4_NURSE", TRUE);
                    ClearAllActions();
                    float fTime = 6.0;
                    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
                    ActionUnequipItem(oWeapon);
                    vector vFace = GetPosition(oWounded);
                    ActionDoCommand(SetFacingPoint(vFace));
                    ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, fTime);
                    ActionDoCommand(WalkWayPoints());
                    ActionDoCommand(SetLocalInt(OBJECT_SELF, "NW_M4_NURSE", FALSE));
                }
                else
                {
                    WalkWayPoints();
                    //SetLocalInt(OBJECT_SELF, "NW_M4_NURSE", FALSE);
                }
            }
            else
            {
                SpeakString("No wounded.");
            }

        }
    }*/
    if(nUser==1001)
    {
        if(GetLocalInt(OBJECT_SELF,"NW_M4_NURSE")==FALSE && !IsInConversation(OBJECT_SELF) && !GetIsInCombat())
        {
            int nRand = d4();
            if(nRand==1)
            {
                ClearAllActions();
                ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_M4_NURSE",TRUE));
                ActionMoveToObject(GetObjectByTag("WP_M4_NURSE1_01"));
                object oWounded = GetNearestObjectByTag("M4_WOUNDED");
                vector vFace = GetPosition(oWounded);
                ActionDoCommand(SetFacingPoint(vFace));
                ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 6.0);
                ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_M4_NURSE",FALSE));
            }
            else if(nRand==2)
            {
                ClearAllActions();
                ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_M4_NURSE",TRUE));
                ActionMoveToObject(GetObjectByTag("WP_M4_NURSE1_02"));
                object oWounded = GetNearestObjectByTag("M4_WOUNDED");
                vector vFace = GetPosition(oWounded);
                ActionDoCommand(SetFacingPoint(vFace));
                ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 6.0);
                ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_M4_NURSE",FALSE));

            }
            else if(nRand==3)
            {
                ClearAllActions();
                ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_M4_NURSE",TRUE));
                ActionMoveToObject(GetObjectByTag("WP_M4_NURSE1_03"));
                object oWounded = GetNearestObjectByTag("M4_WOUNDED");
                vector vFace = GetPosition(oWounded);
                ActionDoCommand(SetFacingPoint(vFace));
                ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 6.0);
                ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_M4_NURSE",FALSE));

            }
            else if(nRand==4)
            {
                ClearAllActions();
                ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_M4_NURSE",TRUE));
                ActionMoveToObject(GetObjectByTag("WP_M4_NURSE1_04"));
                object oWounded = GetNearestObjectByTag("M4_WOUNDED");
                vector vFace = GetPosition(oWounded);
                ActionDoCommand(SetFacingPoint(vFace));
                ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 6.0);
                ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_M4_NURSE",FALSE));

            }
        }
    }
    else if(nUser == 1003)
    {
        SetLocalInt(OBJECT_SELF, "NW_M4_NURSE", FALSE);
    }
}
