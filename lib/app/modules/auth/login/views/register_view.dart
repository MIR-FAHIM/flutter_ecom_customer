// lib/app/modules/auth/views/register_view.dart
import 'dart:ui';
import 'package:ecom_user_flutter/app/modules/auth/login/controllers/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<LoginController> {
  const RegisterView({super.key});

  static const Color _navy = Color(0xFF1F214C);
  static const Color _accent = Color(0xFF16A34A);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            const _Background(),
            SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 22),
                child: Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _TopBar(
                        title: "Create Account".tr,
                        subtitle: "Fill the details to register.".tr,
                        onBack: () => Get.back(),
                      ),
                      const SizedBox(height: 16),

                      _GlassCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _SectionTitle(title: "Basic Info".tr),
                            const SizedBox(height: 12),

                            _Input(
                              label: "Name".tr,
                              hint: "Your full name".tr,
                              icon: CupertinoIcons.person,
                              keyboardType: TextInputType.name,
                              onChanged: (v) => controller.name.value = v,
                              validator: (v) {
                                final s = (v ?? '').trim();
                                if (s.isEmpty) return "Name is required".tr;
                                if (s.length < 2) return "Name is too short".tr;
                                return null;
                              },
                            ),
                            const SizedBox(height: 12),

                            _Input(
                              label: "Email".tr,
                              hint: "example@mail.com".tr,
                              icon: CupertinoIcons.mail,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (v) => controller.email.value = v,
                              validator: (v) {
                                final s = (v ?? '').trim();
                                if (s.isEmpty) return "Email is required".tr;
                                final ok = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(s);
                                if (!ok) return "Enter a valid email".tr;
                                return null;
                              },
                            ),
                            const SizedBox(height: 12),

                            Obx(() {
                              return _Input(
                                label: "Password".tr,
                                hint: "••••••".tr,
                                icon: CupertinoIcons.lock,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: controller.hidePassword.value,
                                onChanged: (v) => controller.password.value = v,
                                validator: (v) {
                                  final s = (v ?? '').trim();
                                  if (s.isEmpty) return "Password is required".tr;
                                  if (s.length < 6) return "Password must be at least 6 characters".tr;
                                  return null;
                                },
                                suffix: IconButton(
                                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                                  icon: Icon(
                                    controller.hidePassword.value
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: controller.hidePassword.value ? Colors.grey : _navy,
                                  ),
                                ),
                              );
                            }),

                            const SizedBox(height: 16),
                            _SectionTitle(title: "Contact Info".tr),
                            const SizedBox(height: 12),

                            _Input(
                              label: "Mobile".tr,
                              hint: "01XXXXXXXXX".tr,
                              icon: CupertinoIcons.device_phone_portrait,
                              keyboardType: TextInputType.phone,
                              onChanged: (v) => controller.mobile.value = v,
                              validator: (v) {
                                final s = (v ?? '').trim();
                                if (s.isEmpty) return "Mobile is required".tr;
                                if (s.length < 10) return "Enter a valid mobile number".tr;
                                return null;
                              },
                            ),
                            const SizedBox(height: 12),

                            _Input(
                              label: "Address".tr,
                              hint: "Street, area, city".tr,
                              icon: CupertinoIcons.location_solid,
                              keyboardType: TextInputType.streetAddress,
                              maxLines: 3,
                              onChanged: (v) => controller.address.value = v,
                              validator: (v) {
                                final s = (v ?? '').trim();
                                if (s.isEmpty) return "Address is required".tr;
                                if (s.length < 6) return "Address is too short".tr;
                                return null;
                              },
                            ),

                            const SizedBox(height: 16),






                            Obx(() {
                              return SizedBox(
                                height: 54,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: _accent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),
                                  onPressed: () {


                               controller.signUp();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (controller.isLoading.value) ...[
                                        const SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                      ],
                                      Text(
                                        controller.isLoading.value ? "Please wait...".tr : "Create Account".tr,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),

                            const SizedBox(height: 12),

                            Text(
                              "By continuing, you agree to our Terms & Privacy Policy.".tr,
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?".tr,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white.withOpacity(0.85),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 6),
                          TextButton(
                            onPressed: () => Get.back(),
                            child: const Text(
                              "Login",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------------- Controller skeleton (use in your existing folder) ---------------- */


/* ---------------- UI widgets ---------------- */

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF0F172A), Color(0xFF1F214C), Color(0xFF0B1220)],
              ),
            ),
          ),
          Positioned(
            top: -70,
            left: -60,
            child: _Blob(color: const Color(0xFF16A34A).withOpacity(0.25), size: 220),
          ),
          Positioned(
            bottom: 70,
            right: -70,
            child: _Blob(color: const Color(0xFFF4B73E).withOpacity(0.20), size: 240),
          ),
          Positioned.fill(child: Container(color: Colors.black.withOpacity(0.18))),
        ],
      ),
    );
  }
}

class _Blob extends StatelessWidget {
  const _Blob({required this.color, required this.size});
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 26, sigmaY: 26),
      child: Container(width: size, height: size, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.title, required this.subtitle, required this.onBack});
  final String title;
  final String subtitle;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onBack,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white.withOpacity(0.14)),
            ),
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withOpacity(0.82),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _GlassCard extends StatelessWidget {
  const _GlassCard({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.92),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.65)),
            boxShadow: [
              BoxShadow(
                blurRadius: 26,
                offset: const Offset(0, 16),
                color: Colors.black.withOpacity(0.22),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: const Color(0xFF16A34A),
            borderRadius: BorderRadius.circular(99),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

class _Input extends StatelessWidget {
  const _Input({
    required this.label,
    required this.hint,
    required this.icon,
    required this.keyboardType,
    required this.onChanged,
    this.validator,
    this.obscureText = false,
    this.suffix,
    this.maxLines = 1,
  });

  final String label;
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffix;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: const Color(0xFF1F214C)),
        suffixIcon: suffix,
        filled: true,
        fillColor: const Color(0xFFF7F7FB),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        errorMaxLines: 2,
      ),
    );
  }
}

