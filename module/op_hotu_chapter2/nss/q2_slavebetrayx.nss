//::///////////////////////////////////////////////
//:: q2_slavebetrayx
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the player betrayed Argosus and the
    slaves to the Overmind
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
void main()
{


        AddJournalQuestEntry("q2_slaverevolt",99,GetPCSpeaker());
      AddJournalQuestEntry("q2_zorvakmur",50,GetPCSpeaker());

      SetLocalInt(GetModule(),"X2_Q2Dslave_betrayal",TRUE);
}
