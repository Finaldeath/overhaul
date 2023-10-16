//::///////////////////////////////////////////////
//:: Name q2_endcon_yazka
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//if Conversation is aborted after Urko gives the PC
the hand - the kobolds should flee the area..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 3/03
//:://////////////////////////////////////////////


void LeaveCrypt(object oKobold, object oWP);
void CreateNewUrko();
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nKoboldsReadyToFlee") == 1)
    {
        int n = 1;
        object oWP = GetWaypointByTag("Q2_WP_KOBOLD_EXIT");

        object oYazka = GetNearestObjectByTag("q2_yazka");
        object oKipper = GetNearestObjectByTag("q2_kipper");
        object oSer = GetNearestObjectByTag("Q2_KOBOLD_SER");

        LeaveCrypt(oYazka, oWP);
        LeaveCrypt(oKipper, oWP);
        LeaveCrypt(oSer, oWP);

        object oKob = GetNearestObjectByTag("NW_KOBOLD001", OBJECT_SELF, n);
        while(oKob != OBJECT_INVALID &&
                GetArea(oKob) == GetArea(OBJECT_SELF))
        {
            SignalEvent(oKob, EventUserDefined(101));
            //LeaveCrypt(oKob, oWP);
            n++;
            oKob = GetNearestObjectByTag("NW_KOBOLD001", OBJECT_SELF, n);
        }
        n = 1;
        oKob = GetNearestObjectByTag("q2_yazka1", OBJECT_SELF, n);
        while(oKob != OBJECT_INVALID &&
                GetArea(oKob) == GetArea(OBJECT_SELF))
        {
            SignalEvent(oKob, EventUserDefined(101));
            //LeaveCrypt(oKob, oWP);
            n++;
            oKob = GetNearestObjectByTag("q2_yazka1", OBJECT_SELF, n);
        }
        n = 1;
        oKob = GetNearestObjectByTag("FleeingKobold", OBJECT_SELF, n);
        while(oKob != OBJECT_INVALID &&
                GetArea(oKob) == GetArea(OBJECT_SELF))
        {
            LeaveCrypt(oKob, oWP);
            //LeaveCrypt(oKob, oWP);
            n++;
            oKob = GetNearestObjectByTag("FleeingKobold", OBJECT_SELF, n);
        }
        int nStatus = GetLocalInt(GetModule(), "q5_Urko_Status");
        if(nStatus == 0)
            SetLocalInt(GetModule(), "q5_Urko_Status", 1);
        LeaveCrypt(OBJECT_SELF, oWP); // this is for urko

        DelayCommand(14.0, CreateNewUrko());
    }
}
void LeaveCrypt(object oKobold, object oWP)
{
    AssignCommand(oKobold, ClearAllActions());
    AssignCommand(oKobold, ActionForceMoveToObject(oWP));
    DestroyObject(oKobold, 15.0);
    AssignCommand(oKobold, SetIsDestroyable(TRUE));
    DelayCommand(1.0, SetCommandable(FALSE, oKobold));
}
void CreateNewUrko()
{
    if (GetLocalInt(GetModule(), "q5_Urko_Status") != 2)
    {
        //Create Urko in the Chief's room in the Kobold Cave
        location lSpawn = GetLocation(GetWaypointByTag("wp_q5_urko_spn"));
        CreateObject(OBJECT_TYPE_CREATURE, "q5_urko", lSpawn);
    }
}
