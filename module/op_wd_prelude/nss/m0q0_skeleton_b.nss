//* If I've been turned, Trial has been completed
void main()
{
//* Check if healed
    if(GetLastSpell() == SPELLABILITY_TURN_UNDEAD &&
       GetTag(GetLastSpellCaster()) != "M1Q0Tabitha")
    {
        SetPlotFlag(OBJECT_SELF,FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDeath(TRUE),OBJECT_SELF);
        if(GetLocalInt(GetModule(),"NW_G_M1Q0HalfPriest") == TRUE)
        {
            SetLocalInt(GetModule(),"NW_G_M0Q01_PRIEST_TEST",2);
            AssignCommand(GetNearestObjectByTag("M1Q0BElynwyd"),
                          SpeakOneLinerConversation());
        }
        else
        {
            SetLocalInt(GetModule(),"NW_G_M1Q0HalfPriest",TRUE);
        }
    }
}
