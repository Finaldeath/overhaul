//::///////////////////////////////////////////////
//:: Die Roll: 2d8
//:: DieRoll_G_2d8.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a 2d8 broadcast string.
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
    int i1d8 = Random(8)+1;
    int i2d8 = Random(8)+1;
    int iTotal = i1d8 + i2d8;

    //Convert the rolls and totals to strings
    string s1d8 = IntToString(i1d8);
    string s2d8 = IntToString(i2d8);
    string sTotal = IntToString(iTotal);

    //Compile the string to be broadcast and save it out as a local
    string sBroadcast = sName+" rolls 2d8 ("+s1d8+", "+s2d8+"): TOTAL = "+sTotal+".";
    SetLocalString(oRoller, "DiceBagBroadcast", sBroadcast);
}
