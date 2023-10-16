//::///////////////////////////////////////////////
//:: Die Roll: 1d12
//:: DieRoll_G_1d12.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a 1d12 broadcast string.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 24, 2002
//:://////////////////////////////////////////////

void main()
{
    //Figure out who rolled the dice
    object oRoller = GetPCSpeaker();
    string sName = GetName(oRoller);

    //Roll the dice and tally them up
    int i1d12 = Random(12)+1;
    int iTotal = i1d12;

    //Convert the rolls and totals to strings
    string s1d12 = IntToString(i1d12);
    string sTotal = IntToString(iTotal);

    //Compile the string to be broadcast and save it out as a local
    string sBroadcast = sName+" rolls 1d12 ("+s1d12+"): TOTAL = "+sTotal+".";
    SetLocalString(oRoller, "DiceBagBroadcast", sBroadcast);
}
