//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_ud_puzarea
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Creates the portal that leads to the knower
     of places.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 25, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
// Delayed create for any types.
void DelayCreateObject(int iType, string sRes, location lLoc)
{
    CreateObject(iType, sRes, lLoc);
}

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 4444)
    {
        object oActivator = GetFirstPC();
        object oInvis = GetObjectByTag("portal_invis");
        location lInvis = GetLocation(oInvis);

        DelayCommand(1.0, AssignCommand(oActivator, SetFacingPoint(GetPosition(oInvis))));
        DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), lInvis));
        DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUNBEAM), lInvis));
        DelayCommand(5.0, DelayCreateObject(OBJECT_TYPE_PLACEABLE, "end_portal", lInvis));
        DelayCommand(6.8, AssignCommand(oActivator, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1)));
        DelayCommand(7.0, AssignCommand(oActivator, PlayVoiceChat(VOICE_CHAT_CHEER, OBJECT_SELF)));
        DelayCommand(8.0, AddJournalQuestEntry("q4a_gargs", 60, oActivator, TRUE, TRUE));
        //Give non-repeatable XP
        int i2daRow = 125;
        int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
        if (bDuplicate == FALSE)
        {
          SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
          DelayCommand(8.0, Reward_2daXP(oActivator, i2daRow));
        }
    }
}
