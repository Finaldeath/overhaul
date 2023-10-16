// ruins ud event

void Create()
{
    //location lLoc = GetLocalLocation(OBJECT_SELF, "SPHINX");
    object oWP = GetWaypointByTag("Q3B_WP_SPHINX");
    object oSphinx = CreateObject(OBJECT_TYPE_CREATURE, "sphinx001", GetLocation(oWP));
    DelayCommand(1.0, AssignCommand(oSphinx, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 0.7)));
    DelayCommand(1.0, AssignCommand(oSphinx, PlayVoiceChat(VOICE_CHAT_BATTLECRY1)));
}

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101)
    {
        object oPortal = GetObjectByTag("Q3B_SAND_PORTAL");
        DestroyObject(oPortal);
    }
    else if(nEvent == 102)
    {
        DelayCommand(0.1, Create());
    }
}
