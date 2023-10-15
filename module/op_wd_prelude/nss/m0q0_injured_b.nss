//* If I've been healed, Trial has been completed
void main()
{
    int nSpell = GetLastSpell();
//* Check if healed
    if(nSpell == SPELL_CURE_MINOR_WOUNDS ||
       nSpell == SPELL_CURE_LIGHT_WOUNDS ||
       nSpell == SPELL_CURE_MODERATE_WOUNDS ||
       nSpell == SPELL_CURE_SERIOUS_WOUNDS ||
       nSpell == SPELL_CURE_CRITICAL_WOUNDS)
    {
        RemoveEffect(OBJECT_SELF,GetFirstEffect(OBJECT_SELF));
        if(GetLocalInt(GetModule(),"NW_G_M1Q0HalfPriest") == TRUE ||
           GetLevelByClass(CLASS_TYPE_DRUID,GetLastSpellCaster()) > 0)
        {
            SetLocalInt(GetModule(),"NW_G_M0Q01_PRIEST_TEST",2);
            AssignCommand(GetNearestObjectByTag("M1Q0BElynwyd"),
                          SpeakOneLinerConversation());
        }
        else
        {
            SetLocalInt(GetModule(),"NW_G_M1Q0HalfPriest",TRUE);
            SetLocalInt(GetModule(),"NW_G_M1Q0Healing",TRUE);
        }
    }
}
