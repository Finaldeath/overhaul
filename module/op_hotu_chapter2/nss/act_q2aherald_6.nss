//Mark that the Herald has spoken with the PC (for his user defined script)
//and doesnt' need to start a conversation with him again.
void main()
{
    //expose the map for the PC
    object oPC = GetPCSpeaker();
    object oArea = GetArea(OBJECT_SELF);
    ExploreAreaForPlayer(oArea, oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneImmobilize(), oPC);

    //Set a variable to help check the save/load bug
    SetLocalInt(oPC, "X2_SiegeUnsafeToLoad", 1);

    //Imloth variables
    SetLocalInt(OBJECT_SELF, "nTalkToPC", 0);
    SetLocalInt(OBJECT_SELF, "nWave2Ready", 1);


    //Imloth won't be following the PC - just the wisp
    if (GetTag(OBJECT_SELF) != "q2arebimloth")
    {
        //Set the PC as the one to be followed.
        SetLocalObject(OBJECT_SELF, "oLeader", oPC);

        //Variable for conversation nodes
        SetLocalInt(OBJECT_SELF, "nSpokeOnce", GetLocalInt(OBJECT_SELF, "nSpokeOnce") + 1);

        //Signal herald to start following the PC
        SignalEvent(OBJECT_SELF, EventUserDefined(101));

        //Variable for abort script of conversation
        SetLocalInt(GetModule(), "X2_Q2AHeraldSpeak", 1);
    }

}
