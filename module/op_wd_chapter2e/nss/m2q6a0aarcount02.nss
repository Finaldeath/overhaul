// a timer will have to be added to this script to prevent the global from
// being changed to 2 right away.  Currently it is automatic.

void main()
{
    DelayCommand(10.0, SetLocalInt(GetPCSpeaker(),"PC_Aarin_Meter",2));
}
