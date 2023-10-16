// Action taken for Gishnak: Make chief killable AND disable surrender for him

void main()
{
    SetImmortal(OBJECT_SELF, FALSE);
    SetLocalInt(OBJECT_SELF,"Generic_Surrender", 1);
}
