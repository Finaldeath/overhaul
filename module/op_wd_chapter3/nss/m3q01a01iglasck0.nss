#include "MQ3TRIAL"

void main()

{
   ////////// Set starting trial values, set TrialPlotStatus to Active

    AddJournalQuestEntry("M3Q1_TRIAL_PLOT",30,GetPCSpeaker());
    SetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS",1);
    SetLocalObject(GetModule(),"NW_G_M3Q01A01TRIALLAWYER",GetPCSpeaker());
    SetCustomToken(3333,GetName(GetPCSpeaker()));
    SetupTrialValues();
}
