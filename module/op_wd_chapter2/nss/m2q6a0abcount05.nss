// this sets the meter to 5, meaning that Aribeth has told her story to the
// player.  This is as high as the meter can get unless the PC is a compatible
// romance interest.

void main()
{
    SetLocalInt(GetPCSpeaker(),"PC_Aribeth_Meter",5);
}
