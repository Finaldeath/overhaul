// 10% chance each heartbeat that a child will say something
// the Heartbeat event must be unremarked in the Spawn() script

void main()
{
    int iEvent = GetUserDefinedEventNumber();
    int iChance = d100();
    if ((iEvent = 1001) && (iChance < 11) && (!GetIsInCombat()))
    {
        SpeakOneLinerConversation("m2q1children");
    }
}
