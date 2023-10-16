//::///////////////////////////////////////////////
//:: Die Roll: 2d12
//:: DieRoll_G_2d12.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a 2d12 broadcast string.
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
    int i2d12 = Random(12)+1;
    int iTotal = i1d12 + i2d12;

    //Convert the rolls and totals to strings
    string s1d12 = IntToString(i1d12);
    string s2d12 = IntToString(i2d12);
    string sTotal = IntToString(iTotal);

    //Compile the string to be broadcast and save it out as a local
    string sBroadcast = sName+" rolls 2d12 ("+s1d12+", "+s2d12+"): TOTAL = "+sTotal+".";
    SetLocalString(oRoller, "DiceBagBroadcast", sBroadcast);
}
