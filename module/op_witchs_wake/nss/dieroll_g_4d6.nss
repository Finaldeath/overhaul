//::///////////////////////////////////////////////
//:: Die Roll: 4d6
//:: DieRoll_G_4d6.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a 4d6 broadcast string.
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
    int i1d6 = Random(6)+1;
    int i2d6 = Random(6)+1;
    int i3d6 = Random(6)+1;
    int i4d6 = Random(6)+1;
    int iTotal = i1d6 + i2d6 + i3d6 + i4d6;

    //Convert the rolls and totals to strings
    string s1d6 = IntToString(i1d6);
    string s2d6 = IntToString(i2d6);
    string s3d6 = IntToString(i3d6);
    string s4d6 = IntToString(i4d6);
    string sTotal = IntToString(iTotal);

    //Compile the string to be broadcast and save it out as a local
    string sBroadcast = sName+" rolls 4d6 ("+s1d6+", "+s2d6+", "+s3d6+", "+s4d6+"): TOTAL = "+sTotal+".";
    SetLocalString(oRoller, "DiceBagBroadcast", sBroadcast);
}
