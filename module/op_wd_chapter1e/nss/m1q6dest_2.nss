void main()
{
    if(GetIsPC(GetLastPerceived()) && GetLastPerceptionSeen())
    {
        SpeakOneLinerConversation();
       // ActionCastSpellAtObject(SPELL_DEATH_WARD,OBJECT_SELF);
    }
}
