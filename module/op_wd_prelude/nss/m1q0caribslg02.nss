void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES",1);
    object oArea = GetArea(OBJECT_SELF);
    SetLocalInt(OBJECT_SELF,"Attack",0);
    SignalEvent(oArea,EventUserDefined(100));
    SignalEvent(GetObjectByTag("Map_M1Q0B"),EventUserDefined(200));
    SignalEvent(GetNearestObjectByTag("M0Q1C_M0Q1B"),EventUserDefined(0));
    //ActionCastSpellAtObject(SPELL_GHOSTLY_VISAGE,GetPCSpeaker(),METAMAGIC_NONE,TRUE,7);
    DelayCommand(1.0,SpeakOneLinerConversation());
}
