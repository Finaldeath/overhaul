//::///////////////////////////////////////////////
//:: Henchman Vote Trigger
//:: q2_init_henvote
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The henchmen initiate after a vote
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////
#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    object oJab = GetNearestObjectByTag("os_hen_jab");
    object oCal = GetNearestObjectByTag("os_hen_cal");
    object oKai = GetNearestObjectByTag("os_hen_kai");
    object oRom = os_CheckRomance(oKai,oCal,oPC);
    int nVotes = GetLocalInt(oPC,"OS_PC_VOTES");
    if(GetEnteringObject()==oPC
        && !os_CheckTriggerEntered())
    {
        if(nVotes == 1)
        {
            //checks the romance plotline
            if(GetIsObjectValid(oRom)
                && GetLocalInt(oRom,"OS_HEN_VOTE")==0)
            {
                SetLocalInt(oRom,"OS_HEN_VOTE",10);
                os_SetTriggerEntered();
                os_SetHenchTrig(oRom,30);
                DestroyObject(OBJECT_SELF);
            }
            else if(GetIsObjectValid(oJab)
                && GetLocalInt(oJab,"OS_HEN_VOTE")==0)
            {
                SetLocalInt(oJab,"OS_HEN_VOTE",10);
                os_SetTriggerEntered();
                os_SetHenchTrig(oJab,20);
                DestroyObject(OBJECT_SELF);
            }
            else if(GetIsObjectValid(oKai)
                && GetLocalInt(oKai,"OS_HEN_VOTE")==0)
            {
                SetLocalInt(oKai,"OS_HEN_VOTE",10);
                os_SetTriggerEntered();
                os_SetHenchTrig(oKai,30);
                DestroyObject(OBJECT_SELF);
            }
            else if(GetIsObjectValid(oCal)
                && GetLocalInt(oCal,"OS_HEN_VOTE")==0)
            {
                SetLocalInt(oCal,"OS_HEN_VOTE",10);
                os_SetTriggerEntered();
                os_SetHenchTrig(oCal,30);
                DestroyObject(OBJECT_SELF);
            }
        }
        else if(nVotes == 2)
        {
            //checks the romance plotline
            if(GetIsObjectValid(oRom)
                && GetLocalInt(oRom,"OS_HEN_VOTE")<20)
            {
                SetLocalInt(oRom,"OS_HEN_VOTE",20);
                os_SetTriggerEntered();
                os_SetHenchTrig(oRom,40);
                DestroyObject(OBJECT_SELF);
            }
            else if(GetIsObjectValid(oCal)
                && GetLocalInt(oCal,"OS_HEN_VOTE")<20)
            {
                SetLocalInt(oCal,"OS_HEN_VOTE",20);
                os_SetTriggerEntered();
                os_SetHenchTrig(oCal,40);
                DestroyObject(OBJECT_SELF);
            }
            else if(GetIsObjectValid(oKai)
                && GetLocalInt(oKai,"OS_HEN_VOTE")<20)
            {
                SetLocalInt(oKai,"OS_HEN_VOTE",20);
                os_SetTriggerEntered();
                os_SetHenchTrig(oKai,40);
                DestroyObject(OBJECT_SELF);
            }
        }
        else if(nVotes == 3)
        {
            if(GetIsObjectValid(oKai)
                && GetLocalInt(oKai,"OS_HEN_VOTE")<30
                && GetLocalInt(GetFirstPC(), "OS_KAI_PLANT")>10)
            {
                SetLocalInt(oKai,"OS_HEN_VOTE",30);
                os_SetTriggerEntered();
                os_SetHenchTrig(oKai,50);
                DestroyObject(OBJECT_SELF);
            }
            else if(GetIsObjectValid(oCal)
                && GetLocalInt(oCal,"OS_HEN_VOTE")<30)
            {
                SetLocalInt(oCal,"OS_HEN_VOTE",30);
                os_SetTriggerEntered();
                os_SetHenchTrig(oCal,50);
                DestroyObject(OBJECT_SELF);
            }
        }
        else if(nVotes == 4)
        {
            if(GetIsObjectValid(oKai)
                && GetLocalInt(oKai,"OS_HEN_VOTE")<40
                && GetLocalInt(GetFirstPC(), "OS_KAI_PLANT")>10
                && GetLocalInt(oPC,"OS_KAI_ROMANCE")<99)
            {
                SetLocalInt(oKai,"OS_HEN_VOTE",40);
                os_SetTriggerEntered();
                os_SetHenchTrig(oKai,60);
                DestroyObject(OBJECT_SELF);
            }
            else if(GetIsObjectValid(oCal)
                && GetLocalInt(oCal,"OS_HEN_VOTE")<40)
            {
                SetLocalInt(oCal,"OS_HEN_VOTE",40);
                os_SetTriggerEntered();
                os_SetHenchTrig(oCal,60);
                DestroyObject(OBJECT_SELF);
            }
        }
    }
}
