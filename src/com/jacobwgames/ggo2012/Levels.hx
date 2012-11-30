package com.jacobwgames.ggo2012;

/**
 * ...
 * @author Jacic
 */

class Levels 
{
	public static var curLevel:Int;
	public static var levelArray:Array<Xml>;
	public static var level1:Xml = Xml.parse('<level width="1280" height="960" needed="6" bmode="0" switchstart="true">
    <Solid id="0" x="0" y="896" />
    <Solid id="1" x="0" y="832" />
    <Solid id="2" x="0" y="768" />
    <Solid id="3" x="0" y="704" />
    <Solid id="4" x="0" y="640" />
    <Solid id="5" x="0" y="576" />
    <Solid id="6" x="0" y="512" />
    <Solid id="7" x="0" y="448" />
    <Solid id="8" x="0" y="384" />
    <Solid id="9" x="0" y="320" />
    <Solid id="10" x="0" y="256" />
    <Solid id="11" x="0" y="192" />
    <Solid id="12" x="0" y="128" />
    <Solid id="13" x="0" y="64" />
    <Solid id="14" x="0" y="0" />
    <Solid id="15" x="64" y="0" />
    <Solid id="16" x="128" y="0" />
    <Solid id="17" x="192" y="0" />
    <Solid id="18" x="256" y="0" />
    <Solid id="19" x="320" y="0" />
    <Solid id="20" x="384" y="0" />
    <Solid id="21" x="448" y="0" />
    <Solid id="22" x="512" y="0" />
    <Solid id="23" x="576" y="0" />
    <Solid id="24" x="640" y="0" />
    <Solid id="25" x="704" y="0" />
    <Solid id="26" x="768" y="0" />
    <Solid id="27" x="832" y="0" />
    <Solid id="28" x="896" y="0" />
    <Solid id="29" x="960" y="0" />
    <Solid id="30" x="1024" y="0" />
    <Solid id="31" x="1088" y="0" />
    <Solid id="32" x="1152" y="0" />
    <Solid id="33" x="1216" y="0" />
    <Solid id="34" x="1216" y="64" />
    <Solid id="35" x="1216" y="128" />
    <Solid id="36" x="1216" y="192" />
    <Solid id="37" x="1216" y="256" />
    <Solid id="38" x="1216" y="320" />
    <Solid id="39" x="1216" y="384" />
    <Solid id="40" x="1216" y="448" />
    <Solid id="41" x="1216" y="512" />
    <Solid id="42" x="1216" y="576" />
    <Solid id="43" x="1216" y="640" />
    <Solid id="44" x="1216" y="704" />
    <Solid id="45" x="1216" y="768" />
    <Solid id="46" x="1216" y="832" />
    <Solid id="47" x="1216" y="896" />
    <Solid id="48" x="64" y="896" />
    <Solid id="49" x="128" y="896" />
    <Solid id="50" x="192" y="896" />
    <Solid id="51" x="256" y="896" />
    <Solid id="52" x="320" y="896" />
    <Solid id="53" x="384" y="896" />
    <Solid id="54" x="448" y="896" />
    <Solid id="55" x="512" y="896" />
    <Solid id="56" x="576" y="896" />
    <Solid id="57" x="640" y="896" />
    <Solid id="58" x="704" y="896" />
    <Solid id="59" x="768" y="896" />
    <Solid id="60" x="832" y="896" />
    <Solid id="61" x="896" y="896" />
    <Solid id="62" x="960" y="896" />
    <Solid id="63" x="1024" y="896" />
    <Solid id="64" x="1088" y="896" />
    <Solid id="65" x="1152" y="896" />
    <Solid id="66" x="1152" y="832" />
    <Solid id="67" x="576" y="832" />
    <Solid id="68" x="1088" y="832" />
    <Solid id="69" x="1024" y="832" />
    <Solid id="70" x="960" y="832" />
    <Solid id="71" x="896" y="832" />
    <Solid id="72" x="832" y="832" />
    <Solid id="73" x="768" y="832" />
    <Solid id="74" x="704" y="832" />
    <Solid id="75" x="640" y="832" />
    <Solid id="76" x="704" y="768" />
    <Solid id="77" x="768" y="768" />
    <Solid id="78" x="832" y="768" />
    <Solid id="79" x="896" y="768" />
    <Solid id="80" x="960" y="768" />
    <Solid id="81" x="1024" y="768" />
    <Solid id="82" x="1088" y="768" />
    <Solid id="83" x="1152" y="768" />
    <Solid id="84" x="1152" y="704" />
    <Solid id="85" x="1088" y="704" />
    <Solid id="86" x="1024" y="704" />
    <Solid id="87" x="1152" y="640" />
    <Solid id="89" x="960" y="480" />
    <Solid id="90" x="896" y="480" />
    <Solid id="91" x="832" y="480" />
    <Solid id="92" x="768" y="480" />
    <Solid id="93" x="704" y="480" />
    <Solid id="94" x="640" y="480" />
    <Solid id="95" x="576" y="480" />
    <Solid id="96" x="512" y="480" />
    <Solid id="97" x="448" y="480" />
    <Solid id="98" x="384" y="480" />
    <Solid id="101" x="192" y="480" />
    <Solid id="102" x="256" y="480" />
    <Solid id="103" x="320" y="480" />
    <Solid id="104" x="192" y="416" />
    <Solid id="105" x="256" y="416" />
    <Solid id="88" x="128" y="416" />
    <Solid id="99" x="64" y="416" />
    <Solid id="100" x="192" y="352" />
    <Solid id="106" x="256" y="352" />
    <Goal id="108" x="96" y="384" />
    <Clone id="0" x="96" y="768" />
	</level>');
	public static var level2:Xml = Xml.parse('<level width="1280" height="960" needed="6" bmode="0" switchstart="true">
    <Solid id="0" x="0" y="0" />
    <Solid id="1" x="64" y="0" />
    <Solid id="2" x="128" y="0" />
    <Solid id="3" x="192" y="0" />
    <Solid id="4" x="256" y="0" />
    <Solid id="5" x="320" y="0" />
    <Solid id="6" x="384" y="0" />
    <Solid id="7" x="448" y="0" />
    <Solid id="8" x="512" y="0" />
    <Solid id="9" x="576" y="0" />
    <Solid id="10" x="640" y="0" />
    <Solid id="11" x="704" y="0" />
    <Solid id="12" x="768" y="0" />
    <Solid id="13" x="832" y="0" />
    <Solid id="14" x="896" y="0" />
    <Solid id="15" x="960" y="0" />
    <Solid id="16" x="1024" y="0" />
    <Solid id="17" x="1088" y="0" />
    <Solid id="18" x="1152" y="0" />
    <Solid id="19" x="1216" y="0" />
    <Solid id="20" x="0" y="64" />
    <Solid id="21" x="0" y="128" />
    <Solid id="22" x="0" y="192" />
    <Solid id="23" x="0" y="256" />
    <Solid id="24" x="0" y="320" />
    <Solid id="25" x="0" y="384" />
    <Solid id="26" x="0" y="448" />
    <Solid id="27" x="0" y="512" />
    <Solid id="28" x="0" y="576" />
    <Solid id="29" x="0" y="640" />
    <Solid id="30" x="0" y="704" />
    <Solid id="31" x="0" y="768" />
    <Solid id="32" x="0" y="832" />
    <Solid id="33" x="0" y="896" />
    <Solid id="34" x="1216" y="64" />
    <Solid id="35" x="1216" y="128" />
    <Solid id="36" x="1216" y="192" />
    <Solid id="37" x="1216" y="256" />
    <Solid id="38" x="1216" y="320" />
    <Solid id="39" x="1216" y="384" />
    <Solid id="40" x="1216" y="448" />
    <Solid id="41" x="1216" y="512" />
    <Solid id="42" x="1216" y="576" />
    <Solid id="43" x="1216" y="640" />
    <Solid id="44" x="1216" y="704" />
    <Solid id="45" x="1216" y="768" />
    <Solid id="46" x="1216" y="832" />
    <Solid id="47" x="1216" y="896" />
    <Solid id="48" x="64" y="896" />
    <Solid id="49" x="128" y="896" />
    <Solid id="50" x="192" y="896" />
    <Solid id="51" x="256" y="896" />
    <Solid id="52" x="320" y="896" />
    <Solid id="53" x="480" y="896" />
    <Solid id="54" x="544" y="896" />
    <Solid id="55" x="736" y="896" />
    <Solid id="56" x="800" y="896" />
    <Solid id="57" x="1024" y="896" />
    <Solid id="58" x="1088" y="896" />
    <Solid id="59" x="1152" y="896" />
    <Solid id="60" x="64" y="832" />
    <Solid id="61" x="128" y="832" />
    <Goal id="62" x="1120" y="864" />
    <Clone id="0" x="80" y="704" />
	</level> ');
	public static var level3:Xml = Xml.parse('<level width="960" height="1600" needed="4" bmode="0" switchstart="true">
    <Solid id="0" x="0" y="1536" />
    <Solid id="1" x="64" y="1536" />
    <Solid id="2" x="128" y="1536" />
    <Solid id="3" x="192" y="1536" />
    <Solid id="4" x="256" y="1536" />
    <Solid id="5" x="448" y="1536" />
    <Solid id="6" x="512" y="1536" />
    <Solid id="7" x="576" y="1536" />
    <Solid id="8" x="640" y="1536" />
    <Solid id="9" x="704" y="1536" />
    <Solid id="10" x="768" y="1536" />
    <Solid id="11" x="832" y="1536" />
    <Solid id="12" x="896" y="1536" />
    <Solid id="13" x="576" y="1472" />
    <Solid id="14" x="640" y="1472" />
    <Solid id="15" x="704" y="1472" />
    <Solid id="16" x="768" y="1472" />
    <Solid id="17" x="832" y="1472" />
    <Solid id="18" x="896" y="1472" />
    <Solid id="19" x="704" y="1408" />
    <Solid id="20" x="768" y="1408" />
    <Solid id="21" x="832" y="1408" />
    <Solid id="22" x="896" y="1408" />
    <Solid id="23" x="896" y="1024" />
    <Solid id="24" x="832" y="1024" />
    <Solid id="27" x="448" y="1024" />
    <Solid id="28" x="0" y="1024" />
    <Solid id="29" x="64" y="1024" />
    <Solid id="30" x="128" y="1024" />
    <Solid id="31" x="192" y="1024" />
    <Solid id="32" x="0" y="960" />
    <Solid id="33" x="64" y="960" />
    <Solid id="34" x="128" y="960" />
    <Solid id="35" x="928" y="960" />
    <Solid id="36" x="928" y="896" />
    <Solid id="37" x="928" y="832" />
    <Solid id="38" x="928" y="768" />
    <Solid id="39" x="928" y="704" />
    <Solid id="40" x="928" y="640" />
    <Solid id="41" x="928" y="576" />
    <Solid id="42" x="928" y="512" />
    <Solid id="43" x="928" y="448" />
    <Solid id="44" x="-32" y="896" />
    <Solid id="45" x="-32" y="832" />
    <Solid id="46" x="-32" y="768" />
    <Solid id="47" x="-32" y="704" />
    <Solid id="48" x="-32" y="640" />
    <Solid id="49" x="-32" y="576" />
    <Solid id="50" x="-32" y="512" />
    <Solid id="51" x="-32" y="448" />
    <Solid id="52" x="-32" y="1472" />
    <Solid id="53" x="-32" y="1408" />
    <Solid id="54" x="-32" y="1344" />
    <Solid id="55" x="-32" y="1280" />
    <Solid id="56" x="-32" y="1216" />
    <Solid id="57" x="-32" y="1152" />
    <Solid id="58" x="-32" y="1088" />
    <Solid id="59" x="928" y="1344" />
    <Solid id="60" x="928" y="1280" />
    <Solid id="61" x="928" y="1216" />
    <Solid id="62" x="928" y="1152" />
    <Solid id="63" x="928" y="1088" />
    <Solid id="25" x="384" y="1024" />
    <Solid id="26" x="320" y="1024" />
    <Solid id="64" x="256" y="1024" />
	<Solid id="65" x="-32" y="384" />
    <Solid id="66" x="-32" y="320" />
    <Solid id="67" x="-32" y="256" />
    <Solid id="68" x="-32" y="192" />
    <Solid id="69" x="928" y="384" />
    <Solid id="70" x="928" y="320" />
    <Solid id="71" x="928" y="256" />
    <Solid id="72" x="928" y="192" />
    <Solid id="73" x="-32" y="128" />
    <Solid id="74" x="-32" y="64" />
    <Solid id="75" x="928" y="128" />
    <Solid id="76" x="928" y="64" />
	<Solid id="77" x="-32" y="0" />
    <Solid id="78" x="928" y="0" />
    <Clone id="0" x="48" y="1408" />
    <Goal id="1" x="64" y="928" />
	</level>');
	public static var level4:Xml = Xml.parse('<level width="1600" height="960" needed="4" bmode="0" switchstart="true">
    <Solid id="0" x="0" y="896" />
    <Solid id="1" x="64" y="896" />
    <Solid id="2" x="128" y="896" />
    <Solid id="3" x="192" y="896" />
    <Solid id="4" x="256" y="896" />
    <Solid id="5" x="320" y="896" />
    <Solid id="6" x="384" y="896" />
    <Solid id="7" x="448" y="896" />
    <Solid id="8" x="512" y="896" />
    <Solid id="9" x="576" y="896" />
    <SolidSwitch id="10" x="640" y="896" active="true" />
    <SolidSwitch id="11" x="672" y="896" active="true" />
    <SolidSwitch id="12" x="704" y="896" active="true" />
    <SolidSwitch id="13" x="736" y="896" active="true" />
    <SolidSwitch id="14" x="768" y="896" active="true" />
    <SolidSwitch id="15" x="800" y="896" active="true" />
    <SolidSwitch id="16" x="832" y="896" active="true" />
    <SolidSwitch id="17" x="864" y="896" active="true" />
    <Solid id="19" x="960" y="896" />
    <Solid id="20" x="1024" y="896" />
    <Solid id="21" x="1088" y="896" />
    <Solid id="22" x="1152" y="896" />
    <Solid id="23" x="1216" y="896" />
    <Solid id="24" x="1216" y="832" />
    <Solid id="25" x="1280" y="832" />
    <Solid id="26" x="1344" y="832" />
    <Solid id="27" x="1408" y="832" />
    <Solid id="28" x="1472" y="832" />
    <Solid id="29" x="1536" y="832" />
    <Solid id="30" x="256" y="576" />
    <Solid id="31" x="256" y="512" />
    <Solid id="32" x="256" y="448" />
    <Solid id="33" x="256" y="384" />
    <Solid id="34" x="256" y="320" />
    <Solid id="35" x="256" y="256" />
    <Solid id="36" x="256" y="192" />
    <Solid id="37" x="320" y="192" />
    <Solid id="38" x="384" y="192" />
    <Solid id="39" x="0" y="832" />
    <Solid id="40" x="0" y="768" />
    <Solid id="41" x="0" y="704" />
    <Solid id="42" x="0" y="640" />
    <Solid id="43" x="0" y="576" />
    <Solid id="44" x="0" y="512" />
    <Solid id="45" x="0" y="448" />
    <Solid id="46" x="0" y="384" />
    <Solid id="47" x="0" y="320" />
    <Solid id="48" x="0" y="256" />
    <Solid id="49" x="0" y="192" />
    <Solid id="50" x="0" y="128" />
    <Solid id="51" x="0" y="64" />
    <Solid id="52" x="0" y="0" />
    <Solid id="53" x="1536" y="768" />
    <Solid id="54" x="1536" y="704" />
    <Solid id="55" x="1536" y="640" />
    <Solid id="56" x="1536" y="576" />
    <Solid id="57" x="1536" y="512" />
    <Solid id="58" x="1536" y="448" />
    <Solid id="59" x="1536" y="384" />
    <Solid id="60" x="1536" y="320" />
    <Solid id="61" x="1536" y="256" />
    <Solid id="62" x="1536" y="192" />
    <Solid id="63" x="1536" y="128" />
    <Solid id="64" x="1536" y="64" />
    <Solid id="65" x="1536" y="0" />
    <Solid id="66" x="320" y="576" />
    <Solid id="67" x="384" y="576" />
    <Solid id="68" x="448" y="576" />
    <Solid id="69" x="512" y="576" />
    <Solid id="70" x="576" y="576" />
    <Solid id="71" x="640" y="576" />
    <Solid id="72" x="896" y="576" />
    <Solid id="73" x="960" y="576" />
    <Solid id="74" x="1024" y="576" />
    <Goal id="80" x="352" y="544" />
    <Button id="81" x="352" y="864" />
    <SolidSwitch id="82" x="544" y="864" active="true" />
    <SolidSwitch id="83" x="544" y="832" active="true" />
    <SolidSwitch id="84" x="544" y="800" active="true" />
    <SolidSwitch id="85" x="544" y="768" active="true" />
    <SolidSwitch id="86" x="544" y="736" active="true" />
    <SolidSwitch id="87" x="544" y="704" active="true" />
    <SolidSwitch id="88" x="544" y="672" active="true" />
    <SolidSwitch id="89" x="544" y="640" active="true" />
    <SolidSwitch id="90" x="1088" y="608" active="true" />
    <SolidSwitch id="91" x="1120" y="608" active="true" />
    <SolidSwitch id="92" x="1152" y="608" active="true" />
    <SolidSwitch id="93" x="1184" y="608" active="true" />
    <SolidSwitch id="94" x="1216" y="608" active="true" />
    <SolidSwitch id="95" x="1248" y="608" active="true" />
    <SolidSwitch id="96" x="1280" y="608" active="true" />
    <SolidSwitch id="97" x="1312" y="608" active="true" />
    <SolidSwitch id="98" x="1344" y="608" active="true" />
    <SolidSwitch id="99" x="1376" y="608" active="true" />
    <SolidSwitch id="100" x="1408" y="608" active="true" />
    <SolidSwitch id="101" x="1440" y="608" active="true" />
    <SolidSwitch id="102" x="1472" y="608" active="true" />
    <SolidSwitch id="103" x="1504" y="608" active="true" />
    <Solid id="104" x="64" y="-32" />
    <Solid id="105" x="128" y="-32" />
    <Solid id="106" x="192" y="-32" />
    <Solid id="107" x="256" y="-32" />
    <Solid id="108" x="320" y="-32" />
    <Solid id="109" x="384" y="-32" />
    <Solid id="110" x="448" y="-32" />
    <Solid id="111" x="512" y="-32" />
    <Solid id="112" x="576" y="-32" />
    <Solid id="113" x="640" y="-32" />
    <Solid id="114" x="704" y="-32" />
    <Solid id="115" x="768" y="-32" />
    <Solid id="116" x="832" y="-32" />
    <Solid id="117" x="896" y="-32" />
    <Solid id="118" x="960" y="-32" />
    <Solid id="119" x="1024" y="-32" />
    <Solid id="120" x="1088" y="-32" />
    <Solid id="121" x="1152" y="-32" />
    <Solid id="122" x="1216" y="-32" />
    <Solid id="123" x="1280" y="-32" />
    <Solid id="124" x="1344" y="-32" />
    <Solid id="125" x="1408" y="-32" />
    <Solid id="126" x="1472" y="-32" />
    <Solid id="127" x="1280" y="896" />
    <Solid id="128" x="1344" y="896" />
    <Solid id="129" x="1408" y="896" />
    <Solid id="130" x="1472" y="896" />
    <Solid id="131" x="1536" y="896" />
    <SolidSwitch id="132" x="704" y="576" active="true" />
    <SolidSwitch id="133" x="736" y="576" active="true" />
    <SolidSwitch id="134" x="768" y="576" active="true" />
    <SolidSwitch id="135" x="800" y="576" active="true" />
    <SolidSwitch id="136" x="832" y="576" active="true" />
    <SolidSwitch id="137" x="864" y="576" active="true" />
    <Solid id="138" x="64" y="192" />
    <Solid id="139" x="128" y="192" />
    <Solid id="140" x="192" y="192" />
    <Solid id="75" x="448" y="192" />
    <Solid id="76" x="512" y="192" />
    <Solid id="77" x="512" y="256" />
    <Solid id="78" x="512" y="320" />
    <Solid id="79" x="576" y="320" />
    <Solid id="141" x="640" y="320" />
    <Solid id="142" x="704" y="320" />
    <Solid id="143" x="768" y="320" />
    <Solid id="144" x="832" y="320" />
    <SolidSwitch id="18" x="896" y="896" active="true" />
    <SolidSwitch id="145" x="928" y="896" active="true" />
    <Clone id="0" x="128" y="768" />
</level>');
}