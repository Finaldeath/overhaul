//::///////////////////////////////////////////////
//:: Nursing User Defined
//:: M4_NURSING8_D
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

    if(nUser==1001)
    {
        if(GetLocalInt(OBJECT_SELF,"NW_M4_NURSE")==FALSE && !IsInConversation(OBJECT_SELF)
            && !GetIsInCombat())
        {
            int nRand = d4();
            if(nRand==1)
            {
                ClearAllActions();
                ActionDoCommand(SetLocalInt(OBJECT_SELF,"NW_M4_NURSE",TRUE));
                ActionMoveToObject(GetObjectByTag("WP_M4_NURSE8_01"));
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
                ActionMoveToObject(GetObjectByTag("WP_M4_NURSE8_02"));
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
                ActionMoveToObject(GetObjectByTag("WP_M4_NURSE8_03"));
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
                ActionMoveToObject(GetObjectByTag("WP_M4_NURSE8_04"));
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
