void main()
{
    int nEvent = GetUserDefinedEventNumber();
    switch(nEvent)
    {
        case 699:
        {
            if(GetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1Q6A01HelmitesKilled") < 6)
            {
                SpeakOneLinerConversation("M1Q6A01Battle",GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC));
                DelayCommand(10.0,SignalEvent(OBJECT_SELF,EventUserDefined(699)));
            }
        }
        break;
    }
}
