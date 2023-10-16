// * Clear weather
void main()
{
    if (GetLocalInt(OBJECT_SELF, "NW_L_DOONCE") == 0)
    {
        SetWeather(GetArea(OBJECT_SELF), WEATHER_CLEAR);
        SetLocalInt(OBJECT_SELF, "NW_L_DOONCE",1);
    }
}
