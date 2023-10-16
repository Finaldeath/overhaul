void main()
{
    object oPC = GetPCSpeaker();
    object oBook = GetItemPossessedBy(oPC,"M3Q1TrialBook");
    DestroyObject(oBook);
    ExecuteScript("M3Q1LoseTrial",OBJECT_SELF);
    ExecuteScript("M3Q1ClearTrial",OBJECT_SELF);
///    if (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS") ==1)
//////   Set up a speakstring to say "Defense loses by forfeit! Rolgan is guilty by default!  I win again!"
/////   SetLocalInt(GetModule(), "NW_GM3Q01PLOTTRIALSTATUS",2) ;
/////   Clear the everyone but Neurik from the room
////    Place placeable object of the body on a stake out front of the temple with a click trigger that says:
////    "There is a small sign on the ground near the body that reads:  Rolgan of the Uthgardt shares the fate of all who commit the crime of murder.  Tyr's justice is swift."


}
