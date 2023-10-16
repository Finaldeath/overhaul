//::///////////////////////////////////////////////
//:: Nursing User Defined
//:: M4_NURSING3_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make the NPC move to and bend over a patient.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: March 12, 2002
//:://////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser==1001)
    {
        if(GetLocalInt(OBJECT_SELF,"NW_M4_NURSE")==FALSE && !IsInConversation(OBJECT_SELF) && !GetIsInCombat())
        {
            int nRand = d4();
            if(nRand==1)
            {
                ClearAllActions();
                ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_M4_NURSE",TRUE));
                ActionMoveToObject(GetObjectByTag("WP_M4_NURSE5_01"));
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
                ActionMoveToObject(GetObjectByTag("WP_M4_NURSE5_02"));
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
                ActionMoveToObject(GetObjectByTag("WP_M4_NURSE5_03"));
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
                ActionMoveToObject(GetObjectByTag("WP_M4_NURSE5_04"));
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
