//::///////////////////////////////////////////////
//:: Morgroth Custom User-Defined Event Script
//:: morgroth10.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Null Script. (Easier than swapping scripts
     out of all of the Morgroth creatures.)
*/
//:://////////////////////////////////////////////

void main()
{
    int iUDEvent = GetUserDefinedEventNumber();

    if (iUDEvent == 1007) //OnDeath UDEvent#
    {
//        AddJournalQuestEntry("MainPlot", 60, GetLastKiller(), TRUE, TRUE);
    }
}
