#include "NW_I0_Plot"
void main()
{
    if(GetLocalInt(OBJECT_SELF,"Attack") ==99)
    {
        SetLocalInt(OBJECT_SELF,"Attack",0);
        SetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES",1);
        object oArea = GetArea(OBJECT_SELF);
        SignalEvent(oArea,EventUserDefined(100));
        SignalEvent(GetObjectByTag("Map_M1Q0B"),EventUserDefined(200));
        SignalEvent(GetNearestObjectByTag("M0Q1C_M0Q1B"),EventUserDefined(0));
       //ActionCastSpellAtObject(SPELL_GHOSTLY_VISAGE,GetPCSpeaker(),METAMAGIC_NONE,TRUE,7);
        DelayCommand(1.0,SpeakOneLinerConversation());
     }


    if(GetLocalInt(GetModule(),"NW_PROLOGUE_PLOT") == 99)
    {
        ActionMoveToObject(GetNearestObjectByTag("WP_Return_" + GetTag(OBJECT_SELF)));
    }
    PlayOldTheme();
  /*  object oPC = GetPCSpeaker();
    if(GetLocalInt(GetModule(),"NW_PROLOGUE_PLOT") == 99)
    {
        AddJournalQuestEntry("JOUR_M1Q0Training", 30, oPC);
    }*/
}
