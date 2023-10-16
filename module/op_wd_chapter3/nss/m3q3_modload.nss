// * loaded when the Area is loaded. Can only happen once
void main()
{
    //* Choose the order that the gongs will be played
    if (GetLocalInt(OBJECT_SELF,"NW_L_LOADONCE") == 0)
    {
    SetLocalInt(GetModule(),"M3Q3GongFirst",1);
    SetLocalInt(GetModule(),"M3Q3GongSecond",2);
    SetLocalInt(GetModule(),"M3Q3GongThird",3);
    SetLocalInt(GetModule(),"M3Q3GongFourth",4);
    SetLocalInt(GetModule(),"M3Q3_GongOrder",1);
    SetLocalInt(OBJECT_SELF, "NW_L_LOADONCE",1);
    }
}
