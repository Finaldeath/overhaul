void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_M1Q4A00History") == 0)
        SetLocalInt(OBJECT_SELF,"NW_L_M1Q4A00History",Random(6) + 1);
}
