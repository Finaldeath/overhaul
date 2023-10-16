//::///////////////////////////////////////////////
//:: Name   dan_plot_locals
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This is a script to store all of Dan's plot
     int's.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 6, 2003
//:://////////////////////////////////////////////


int UrkoMetOnce(object oPC)
{
    return GetLocalInt(oPC,"XP1_URKOPLOT")==10;
}

void PCMeetsUrko(object oPC)
{
    SetLocalInt(oPC,"XP1_URKOPLOT",10);
}

void PCAskedUrkoOnce(object oPC)
{
    SetLocalInt(oPC,"XP1_URKOASKED",10);
}

int UrkoAskedOnceAlready(object oPC)
{
    return GetLocalInt(oPC,"XP1_URKOASKED")==10;
}

void YazkaThinksSheIsLeader(object oPC)
{
    SetLocalInt(GetModule(),"XP1_URKOPLOT",20);
}

int IsYazkaLeader()
{
    return GetLocalInt(GetModule(),"XP1_URKOPLOT")==20;
}

int IsUrkoDead()
{
    return GetLocalInt(GetModule(),"XP1_URKODEAD")==1;
}

void PCWontSaveBaby(object oPC)
{
    SetLocalInt(oPC,"X1_Q1SAVEBABY",05);
}

int NoraBegsForHelp(object oPC)
{
    return GetLocalInt(oPC,"X1_Q1SAVEBABY")==05;
}

