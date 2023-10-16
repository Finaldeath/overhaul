// ruins ud event

void Dust()
{
    object oWP = GetWaypointByTag("Q3B_WP_STATUE");
    vector vPos = GetPosition(oWP);
    int i;
    location lLoc;
    object oDust;
    //effect eDam = EffectDamage(1000);
    effect eVis = EffectVisualEffect(353);

    for(i = i; i <= 5; i++)
    {
         lLoc = Location(GetArea(OBJECT_SELF), vPos, 0.0);
         vPos.z += 0.3;
         ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lLoc);
    }
}

void Create()
{
    //location lLoc = GetLocalLocation(OBJECT_SELF, "SPHINX");
    object oWP = GetWaypointByTag("Q3B_WP_STATUE");
    object oStatue = CreateObject(OBJECT_TYPE_CREATURE, "q2e_statue_ba001", GetLocation(oWP));
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oStatue);
    AssignCommand(oStatue, ClearAllActions());
    AssignCommand(oStatue, ActionAttack(oPC));
    DelayCommand(0.1, AssignCommand(oStatue, PlayVoiceChat(VOICE_CHAT_BATTLECRY1)));
}

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101)
    {
        DelayCommand(0.1, Dust());
        DelayCommand(0.5, Create());
    }
}
