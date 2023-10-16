// some delay will have to be added here at some point

void main()
{
    DelayCommand(10.0, SetLocalInt(GetPCSpeaker(),"PC_Aarin_Meter",6));
    SetLocalObject(OBJECT_SELF,"Chapter2_Aarin_Romance",GetPCSpeaker());
}
