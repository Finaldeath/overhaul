//::///////////////////////////////////////////////
//:: Fake Yuan-Ti Heartbeat
//:: 2Q4_Y_FAKE_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 12, 2002
//:://////////////////////////////////////////////

void main()
{
    int nRand = Random(190);
    int nSpellID;

    ActionCastFakeSpellAtObject(nRand, OBJECT_SELF);
    SpeakOneLinerConversation();
}
