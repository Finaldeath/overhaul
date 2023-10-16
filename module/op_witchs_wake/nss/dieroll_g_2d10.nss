//::///////////////////////////////////////////////
//:: Die Roll: 2d10
//:: DieRoll_G_2d10.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a 2d10 broadcast string.
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
    int i1d10 = Random(10)+1;
    int i2d10 = Random(10)+1;
    int iTotal = i1d10 + i2d10;

    //Convert the rolls and totals to strings
    string s1d10 = IntToString(i1d10);
    string s2d10 = IntToString(i2d10);
    string sTotal = IntToString(iTotal);

    //Compile the string to be broadcast and save it out as a local
    string sBroadcast = sName+" rolls 2d10 ("+s1d10+", "+s2d10+"): TOTAL = "+sTotal+".";
    SetLocalString(oRoller, "DiceBagBroadcast", sBroadcast);
}
