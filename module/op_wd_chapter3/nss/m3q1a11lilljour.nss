//::///////////////////////////////////////////////
//:: Updates the Journal after returning Star Sapphire
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

 void main()
 {

     if (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTLILLIAN") == 2)
       {
           SetLocalInt(GetModule(),"NW_G_M3Q01PLOTLILLIAN",3);
           AddJournalQuestEntry("M3Q1_A11_LILLIAN",30, GetPCSpeaker());
       }

       if (GetLocalInt(GetModule(),"NW_G_M3Q01PLOTLILLIAN") == 0)
       {
            SetLocalInt(GetModule(),"NW_G_M3Q01PLOTLILLIAN",1);
            AddJournalQuestEntry("M3Q1_A11_LILLIAN",10, GetPCSpeaker());

       }
   }
