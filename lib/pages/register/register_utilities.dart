import 'package:flutter/material.dart';

class CFormField extends StatelessWidget {
  const CFormField({
    Key? key,
    required TextEditingController controller,
    required this.label,
    required this.message,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final String label;
  final String message;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: _controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return message;
          }
          return null;
        },
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
            // gapPadding: 5.0,
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ), 
        ));
  }
}

class TextAreaFormField extends StatelessWidget {
  const TextAreaFormField({
    Key? key,
    required TextEditingController controller,
    required this.label,
    required this.message,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final String label;
  final String message;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: _controller,
        maxLines: 7,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return message;
          }
          return null;
        },
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
            // gapPadding: 5.0,
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2.0,
            ),
          ), 
        ));
  }
}

class PFormField extends StatefulWidget {
  final TextEditingController _controller;
  PFormField({
    Key? key,
    required TextEditingController controller, required String? Function(dynamic value) validator,
    
  })  : _controller = controller,
        super(key: key);

  @override
  State<PFormField> createState() => _PFormFieldState();
}

class _PFormFieldState extends State<PFormField> {
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      obscureText: _obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        label: Text('Password'),
        labelStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            // width: 2.0,
          ),
        ),
        suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            color: Colors.white,
            onPressed: _toggle),
      ),
    );
  }
}
