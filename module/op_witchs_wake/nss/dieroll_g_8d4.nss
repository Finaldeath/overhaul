//::///////////////////////////////////////////////
//:: Die Roll: 8d4
//:: DieRoll_G_8d4.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a 8d4 broadcast string.
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
    int i1d4 = Random(4)+1;
    int i2d4 = Random(4)+1;
    int i3d4 = Random(4)+1;
    int i4d4 = Random(4)+1;
    int i5d4 = Random(4)+1;
    int i6d4 = Random(4)+1;
    int i7d4 = Random(4)+1;
    int i8d4 = Random(4)+1;
    int iTotal = i1d4 + i2d4 + i3d4 + i4d4 + i5d4 + i6d4 + i7d4 + i8d4;

    //Convert the rolls and totals to strings
    string s1d4 = IntToString(i1d4);
    string s2d4 = IntToString(i2d4);
    string s3d4 = IntToString(i3d4);
    string s4d4 = IntToString(i4d4);
    string s5d4 = IntToString(i5d4);
    string s6d4 = IntToString(i6d4);
    string s7d4 = IntToString(i7d4);
    string s8d4 = IntToString(i8d4);
    string sTotal = IntToString(iTotal);

    //Compile the string to be broadcast and save it out as a local
    string sBroadcast = sName+" rolls 8d4 ("+s1d4+", "+s2d4+", "+s3d4+", "+s4d4+", "+s5d4+", "+s6d4+", "+s7d4+", "+s8d4+"): TOTAL = "+sTotal+".";
    SetLocalString(oRoller, "DiceBagBroadcast", sBroadcast);
}
